#include "Header.h"

int main()
{
    setlocale(LC_ALL, "Russian");
    SETSINCRO setsincro;
    GETSINCRO getsincro;

    ZeroMemory(&setsincro, sizeof(setsincro));
    ZeroMemory(&getsincro, sizeof(getsincro));

    setsincro.cmd = "SINCRO";
    setsincro.correction = 0;

    SYSTEMTIME timeCheck;
    clock_t timer;

    int averageCorrection[10];

    cout << "Сервер запущен" << endl;

    SOCKET servSocket;
    WSADATA wsaLib;

    if (WSAStartup(MAKEWORD(2, 0), &wsaLib) != 0)
        throw GetLastError(WSAGetLastError());

    if ((servSocket = socket(AF_INET, SOCK_DGRAM, NULL)) == INVALID_SOCKET)
        throw GetLastError(WSAGetLastError());

    SOCKADDR_IN serverParam;
    serverParam.sin_family = AF_INET;
    serverParam.sin_port = htons(2000);
    serverParam.sin_addr.s_addr = INADDR_ANY;

    if (bind(servSocket, (LPSOCKADDR)&serverParam, sizeof(serverParam)) == SOCKET_ERROR)
        throw GetLastError(WSAGetLastError());
    int count = 0;
    while (true) {
        SOCKADDR_IN clientParam;
        int lc = sizeof(clientParam);
        int avg = 0;
        GetSystemTime(&timeCheck);

        recvfrom(servSocket, (char*)&getsincro, sizeof(getsincro), NULL, (sockaddr*)&clientParam, &lc);

        timer = clock();
        cout << "Сервер: " << timer << endl;

        setsincro.correction = timer - getsincro.curvalue;

        sendto(servSocket, (char*)&setsincro, sizeof(setsincro), 0, (sockaddr*)&clientParam, lc);

        PrintCurrentTime();
        cout << inet_ntoa(clientParam.sin_addr) << " Коррекция: " << setsincro.correction << ", у клиента(curvalue): " << getsincro.curvalue << "\n" << endl;
        count++;
    }

    if (closesocket(servSocket) == SOCKET_ERROR)
        throw GetLastError(WSAGetLastError());
    if (WSACleanup() == SOCKET_ERROR)
        throw GetLastError(WSAGetLastError());

    system("pause");
    return 0;
}



