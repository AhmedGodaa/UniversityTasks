
#include "vector"
#include "iostream"

using namespace std;


struct process {
    int number;
    int arrivalTime;
    int runningTime;
};

int main() {
    int n;
    cin >> n;


    vector<process> starterQueue(n);
    for (int i = 0; i < n; i++) {
        starterQueue[i].arrivalTime = rand() % 20 + 1;
        starterQueue[i].runningTime = rand() % 100 + 1;
        starterQueue[i].number = i + 1;
    }

    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            if (starterQueue[i].arrivalTime > starterQueue[j].arrivalTime) {
                swap(starterQueue[i], starterQueue[j]);
            }
        }
    }

    cout << "< ---- First Queue of input---- > " << endl;
    for (int i = 0; i < n; i++) {

        cout << " Operation Process Number : " << starterQueue[i].number
             << " Operation Arrival Time : " << starterQueue[i].arrivalTime
             << " Operation Running Time :" << starterQueue[i].runningTime << endl;
    }

    vector<process> queueOne, queueTwo, stackOne, stackTwo;
    for (int i = 0; i < n; i++) {
        int temp = rand() % 4 + 1;
        if (temp == 1)
            queueOne.push_back(starterQueue[i]);
        else if (temp == 2)
            stackOne.push_back(starterQueue[i]);
        else if (temp == 3)
            queueTwo.push_back(starterQueue[i]);
        else
            stackTwo.push_back(starterQueue[i]);
    }

    cout << "Queue 1 " << endl;
    for (int i = 0; i < queueOne.size(); i++) {

        cout << " Operation Process Number : " << queueOne[i].number
             << " Operation Arrival Time : " << queueOne[i].arrivalTime
             << " Operation Running Time :" << queueOne[i].runningTime << endl;
    }

    cout << "Stack 1  " << endl;
    for (int i = 0; i < stackOne.size(); i++) {

        cout << " Operation Process Number : " << stackOne[i].number
             << " Operation Arrival Time : " << stackOne[i].arrivalTime
             << " Operation Running Time :" << stackOne[i].runningTime << endl;
    }

    cout << " Queue 2 " << endl;
    for (int i = 0; i < queueTwo.size(); i++) {

        cout << " Operation Process Number : " << queueTwo[i].number
             << " Operation Arrival Time : " << queueTwo[i].arrivalTime
             << " Operation Running Time :" << queueTwo[i].runningTime << endl;


    }

    cout << "stackTwo: " << endl;
    for (int i = 0; i < stackTwo.size(); i++) {
        cout << " Operation Process Number : " << stackTwo[i].number
             << " Operation Arrival Time : " << stackTwo[i].arrivalTime
             << " Operation Running Time :" << stackTwo[i].runningTime << endl;
    }
    vector<process> runningQueue;
    while (!queueOne.empty() || !stackOne.empty() || !queueTwo.empty() || !stackTwo.empty()) {
        int run = rand() % 4 + 1;
        if (run == 1 && !queueOne.empty()) {
            runningQueue.push_back(queueOne[0]);
            queueOne.erase(queueOne.begin());
        } else if (run == 2 && !stackOne.empty()) {
            runningQueue.push_back(stackOne[stackOne.size() - 1]);
            stackOne.pop_back();
        } else if (run == 3 && !queueTwo.empty()) {
            runningQueue.push_back(queueTwo[0]);
            queueTwo.erase(queueTwo.begin());
        } else if (run == 4 && !stackTwo.empty()) {
            runningQueue.push_back(stackTwo[stackTwo.size() - 1]);
            stackTwo.pop_back();
        }
    }

    cout << "Queue 4 : " << endl;
    for (int i = 0; i < runningQueue.size(); i++) {
        cout << " Operation Process Number : " << runningQueue[i].number
             << " Operation Arrival Time : " << runningQueue[i].arrivalTime
             << " Operation Running Time :" << runningQueue[i].runningTime << endl;
    }
}
