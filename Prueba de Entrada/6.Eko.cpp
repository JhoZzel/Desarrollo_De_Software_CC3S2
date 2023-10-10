/*
	Problem: COCI '11 Contest 5 #2 Eko
	Fuente: https://dmoj.ca/problem/coci11c5p2
*/

#include <bits/stdc++.h>
#define fast_io ios_base::sync_with_stdio(false); cin.tie (NULL)
using namespace std;
typedef long long ll;

const int N = 1e6 + 5;

int n,m;
int a[N];

bool p(int h) {
    ll mad = 0;
    for (int i=0; i<n; i++) {
        if (a[i] > h) mad += a[i] - h;
    }  
    return mad >= m;
}

void solve() {
    cin >> n >> m;
    for (int i=0; i<n; i++) cin >> a[i];

    int lo = 0, hi = 2e9;
    while (lo < hi) {
        int mid = (lo + hi + 1) / 2;
        if (p(mid)) lo = mid; 
        else hi = mid-1;
    }
    cout << lo << "\n";
}

int main() {
    fast_io;
    solve();
    return 0;
}
