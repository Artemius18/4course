#include "Header.h"

int main()
{
    setlocale(LC_CTYPE, "Russian");

    SETSINCRO setsincro;
    GETSINCRO getsincro;

    ZeroMemory(&setsincro, sizeof(setsincro));
    ZeroMemory(&getsincro, sizeof(getsincro));

    getsincro.cmd = "SINCRO";
    getsincro.curvalue = 0;

    SYSTEMTIME timeCheck;
    string ipServer = "127.0.0.1";
    int Tc = 14000;
    int Cc = 0;
    int averageCorrection[10];

    cout << "Клиент запущен" << endl;

    SOCKET clientSocket;
    WSADATA wsaLib;

    if (WSAStartup(MAKEWORD(2, 0), &wsaLib) != 0)
        throw GetLastError(WSAGetLastError());

    if ((clientSocket = socket(AF_INET, SOCK_DGRAM, NULL)) == INVALID_SOCKET)
        throw GetLastError(WSAGetLastError());

    SOCKADDR_IN serverParam;
    serverParam.sin_family = AF_INET;
    serverParam.sin_port = htons(2000);
    serverParam.sin_addr.s_addr = inet_addr(ipServer.c_str());

    int maxCorr = INT_MIN;
    int minCorr = INT_MAX;
    
    for (int count = 0; count < 10; count++) {
        int avg = 0;
        int ls = sizeof(serverParam);

        GetSystemTime(&timeCheck);

        sendto(clientSocket, (char*)&getsincro, sizeof(getsincro), 0, (sockaddr*)&serverParam, ls);
        recvfrom(clientSocket, (char*)&setsincro, sizeof(setsincro), 0, (sockaddr*)&serverParam, &ls);

        if (maxCorr < setsincro.correction) {
            maxCorr = setsincro.correction;
        }

        if (minCorr > setsincro.correction) {
            minCorr = setsincro.correction;
        }

        averageCorrection[count] = setsincro.correction;
        avg = calcAvgCorrection(averageCorrection, count);

        cout << "Коррекция: " << setsincro.correction << ", curvalue: " << getsincro.curvalue << ", Avg: " << avg << ", MinCorr: " << minCorr << ", MaxCorr: " << maxCorr << "\n" << endl;

        if (count == 0)
            getsincro.curvalue += setsincro.correction + Tc;
        else
            getsincro.curvalue += setsincro.correction + Tc;


        Sleep(Tc);
    }

    if (closesocket(clientSocket) == SOCKET_ERROR)
        throw GetLastError(WSAGetLastError());
    if (WSACleanup() == SOCKET_ERROR)
        throw GetLastError(WSAGetLastError());

    system("pause");
    return 0;
}