/*
	Problem: CCC '00 S2 - Babbling Brooks
	Canadian Computing Competition: 2000 Stage 1, Junior #4, Senior #2
	Fuente: https://dmoj.ca/problem/ccc00s2
*/

#include <bits/stdc++.h>
#define fast_io ios_base::sync_with_stdio(false); cin.tie (NULL)
using namespace std;

void solve() {
    int n; cin >> n;
    vector<int> a(n);
    for (int i=0; i<n; i++) cin >> a[i];
    
    int op;
    while(cin >> op) {
        if (op == 77) break;
        if (op == 99) {
            int idx,per;
            cin >> idx >> per;
            idx--;
            
            int now = round(a[idx] * (per / 100.0));
            int next = a[idx] - now;
            
            a[idx] = now;
            a.insert(a.begin() + idx + 1, next);
        }
        if (op == 88) {
            int idx;
            cin >> idx;
            idx--;

            a[idx] += a[idx + 1];
            a.erase(a.begin() + idx + 1);
        }
    }   

    for (int x : a) cout << round(x) << " ";
}

int main() {
    fast_io;
    solve();
    return 0;
}
