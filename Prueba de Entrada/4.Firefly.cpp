/*
	Problem: COCI '06 Regional #3 Firefly
	Fuente: https://dmoj.ca/problem/crci06p3
*/

#include <bits/stdc++.h>
#define fast_io ios_base::sync_with_stdio(false); cin.tie (NULL)
#define all(x) x.begin(), x.end()
using namespace std;

int cnt_obs(vector<int> &a, int n, int h) {
    int lo = 0, hi = n - 1;
    while (lo < hi) {
        int mid = (lo + hi) / 2;
        if (a[mid] < h) lo = mid + 1; 
        else hi = mid;
    }
    return (a[lo] >= h) ? (n - lo) : 0;
}

void solve() {
    int n,H;
    cin >> n >> H;
    n >>= 1;
    
    vector<int> up(n), down(n), frec(H + 1);
    for (int i=0; i<n; i++) {
        cin >> up[i] >> down[i];
    }
    sort(all(up));
    sort(all(down));

    int min_obs = n;
    for (int h = 1; h <= H; h++) {
        frec[h] = cnt_obs(up, n, h) + cnt_obs(down, n, H - h + 1);
        min_obs = min(min_obs, frec[h]);
    }
    
    int levels = 0;
    for (int h = 1; h <= H; h++) {
        levels += frec[h] == min_obs;
    }
    
    cout << min_obs << " " << levels << "\n";
}

int main() {
    fast_io;
    solve();
    return 0;
}
