/*
	Problem: COCI '18 Contest 2 #1 Preokret
	Fuente: https://dmoj.ca/problem/coci18c2p1
*/

#include <bits/stdc++.h>
#define fast_io ios_base::sync_with_stdio(false); cin.tie (NULL)
using namespace std;

const int T = 2880 + 1;

bool A[T];
bool B[T];

void solve() {
    int n,m;  

    cin >> n;
    for (int i=0; i<n; i++) {
        int t; cin >> t;
        A[t] = 1;
    }
    
    cin >> m;
    for (int i=0; i<m; i++) {
        int t; cin >> t;
        B[t] = 1;
    }

    int changes = 0;
    int winner = 0; 
    int rA = 0, rB = 0;
    for (int time = 1; time < T; time++) {
        rA += A[time];
        rB += B[time];
        if (time == T/2) cout << rA + rB << "\n";
        
        int now_winner = 0; 

        if (rA > rB) now_winner = 1; // A
        if (rB > rA) now_winner = 2; // B

        if (now_winner != 0 and now_winner != winner) {
            winner = now_winner;
            changes++;
        }
        
    }
    cout << changes - 1 << "\n";
}

int main() {
    fast_io;
    solve();
    return 0;
}
