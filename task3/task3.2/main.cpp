#include <iostream>
#include <queue>
#include <functional>
#include <thread>
#include <cmath>
#include <iomanip>
#include <fstream>
#include <memory>

enum Task {
    Sin,
    Sqrt,
    Pow
};

template<typename T>
T fun_sin(T x, T y) {
    return std::sin(x);
}

template<typename T>
T fun_sqrt(T x, T y) {
    return std::sqrt(x);
}

template<typename T>
T fun_pow(T x, T y) {
    return std::pow(x, y);
}

namespace Test {
    template<typename T>
    bool IsCorrect(std::ifstream &inputStream) {
        std::unordered_map<std::string, Task> map;
        map["Sin"] = Sin;
        map["Sqrt"] = Sqrt;
        map["Pow"] = Pow;
        size_t id;
        std::string taskString;
        Task taskType;
        T res, x, y, a;
        bool okFlag = false;
        while (inputStream && !okFlag) {
            inputStream >> id >> taskString;
            taskType = map[taskString];
            if (taskType == Pow)
                inputStream >> res >> x >> y;
            else
                inputStream >> res >> x;
            switch (taskType) {
                case Sin:
                    a = fun_sin(x, static_cast<T>(0));
                    if (((fun_sin(x, static_cast<T>(0)) - res) > 0.1) ||
                        ((fun_sin(x, static_cast<T>(0)) - res) < 0.1))
                        okFlag = true;
                    break;
                case Sqrt:
                    if (((fun_sqrt(x, static_cast<T>(0)) - res) > 0.1) ||
                        ((fun_sqrt(x, static_cast<T>(0)) - res) < 0.1))
                        okFlag = true;
                    break;
                case Pow:
                    if (((fun_pow(x, y) - res) > 0.1) ||
                        ((fun_pow(x, y) - res) < 0.1))
                        okFlag = true;
                    break;
            }
        }
        return okFlag;
    }
}

template<typename T>
class Server {
private:
    std::mutex queueMutex;
    std::queue<std::tuple<Task, T, T>> taskQueue;
    size_t taskId;
    std::vector<std::tuple<std::string, T, T, T>> results;
    std::jthread serverThread;

    void Work(const std::stop_token &stopToken) {
        while (!stopToken.stop_requested()) {
            {
                std::lock_guard guard(queueMutex);
                if (taskQueue.empty()) {
                    std::this_thread::sleep_for(std::chrono::milliseconds(100));
                    continue;
                }
            }
            queueMutex.lock();
            std::tuple<Task, T, T> task = taskQueue.front();
            queueMutex.unlock();
            T x = get<1>(task);
            T y = get<2>(task);
            switch (get<0>(task)) {
                case Sin:
                    results.push_back({"Sin", fun_sin(x, y), x, y});
                    break;
                case Sqrt:
                    results.push_back({"Sqrt", fun_sqrt(x, y), x, y});
                    break;
                case Pow:
                    results.push_back({"Pow", fun_pow(x, y), x, y});
                    break;
            }
            std::lock_guard guard(queueMutex);
            taskQueue.pop();
        }
    }

public:
    Server() : taskId{}, serverThread{} {}

    void Start() {
        serverThread = std::jthread(&Server::Work, this);
    }

    void Stop() {
        serverThread.request_stop();
    }

    size_t AddTask(Task taskType, T x, T y) {
        std::lock_guard guard(queueMutex);
        taskQueue.emplace(taskType, x, y);
        return taskId++;
    }

    T RequestResult(size_t id) {
        return results[id];
    }

    std::vector<std::tuple<std::string, T, T, T>> GetResult() {
        return std::move(results);
    }
};


template<typename T>
class Client {
public:
    Client(const Server<T> &server, Task taskType) :
            server((Server<T> &) server),
            taskType(taskType) {}

    void Start(int N) {
        thread = std::jthread([N, this] {
            for (int i = 0; i < N; ++i)
                server.AddTask(taskType, rand() % 100, rand() % 4);
        });
    }

    void Join(){
        thread.join();
    }

private:
    Server<T> &server;
    Task taskType;
    std::jthread thread;
};

template<typename T>
std::vector<std::tuple<std::string, T, T, T>> Process() {
    auto server = new Server<T>();
    auto client_sin = new Client<T>(*server, Sin);
    auto client_sqrt = new Client<T>(*server, Sqrt);
    auto client_pow = new Client<T>(*server, Pow);

    client_sin->Start(10000);
    client_sqrt->Start(10000);
    client_pow->Start(10000);

    client_sin->Join();
    client_sqrt->Join();
    client_pow->Join();

    server->Start();

    std::this_thread::sleep_for(std::chrono::milliseconds(1));
    server->Stop();

    auto results = server->GetResult();
    delete server;
    delete client_sin;
    delete client_sqrt;
    delete client_pow;
    return std::move(results);
}

int main() {
    std::srand(std::time(nullptr));
    auto res = Process<double>();
    std::ofstream outputFile;
    outputFile.open("output.txt");
    outputFile << std::fixed << std::setprecision(5);
    for (size_t i{}; i < res.size(); ++i) {
        if (get<0>(res[i]) == "Pow")
            outputFile << i << " "
                       << get<0>(res[i]) << " "
                       << get<1>(res[i]) << " "
                       << get<2>(res[i]) << " "
                       << get<3>(res[i]) << std::endl;
        else
            outputFile << i << " "
                       << get<0>(res[i]) << " "
                       << get<1>(res[i]) << " "
                       << get<2>(res[i]) << std::endl;
    }
    outputFile.close();
    std::ifstream testInput("output.txt");
    if (Test::IsCorrect<double>(testInput))
        std::cout << "Everything is correct!" << std::endl;
    else
        std::cout << "Something went wrong!" << std::endl;
    return 0;
}