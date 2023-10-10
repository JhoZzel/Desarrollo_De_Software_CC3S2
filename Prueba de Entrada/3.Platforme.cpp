/*
	Problem: COCI '07 Regional #1 Platforme
	Fuente: https://dmoj.ca/problem/crci07p1
*/

#include <bits/stdc++.h>
#define fast_io ios_base::sync_with_stdio(false); cin.tie (NULL)
using namespace std;
typedef tuple<int,int,int> ti;

int get_hight(vector<ti> & a, int n, int y_pos, int x_left, int x_right) {
    int d1 = y_pos;
    int d2 = y_pos;
    for (int i=0; i<n; i++) {
        int x1,x2,y;
        tie(y,x1,x2) = a[i];
        if (x_left + 0.5 > x1 and x_left + 0.5 < x2 and y < y_pos) d1 = min(d1, y_pos - y);
        if (x_right - 0.5 > x1 and x_right - 0.5 < x2 and y < y_pos) d2 = min(d2, y_pos - y);
    }
    return d1 + d2;
}

void solve() {
    int n; 
    cin >> n;
    
    vector<ti> a;
    for (int i=0; i<n; i++) {
        int x1,x2,y;
        cin >> y >> x1 >> x2;
        a.emplace_back(y,x1,x2);
    }

    int ans = 0;
    for (int i=0; i<n; i++) {
        int x1,x2,y;
        tie(y,x1,x2) = a[i];
        ans += get_hight(a,n,y,x1,x2);
    }
    cout << ans << "\n";
}

int main() {
    fast_io;
    solve();
    return 0;
}
