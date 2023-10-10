/*
	Problem: COCI '10 Contest 1 #2 Profesor
	Fuente: https://dmoj.ca/problem/coci10c1p2
*/

#include <bits/stdc++.h>
#define fast_io ios_base::sync_with_stdio(false); cin.tie (NULL)
#define F first
#define S second
using namespace std;
typedef pair<int,int> pii;

int get_max_subseq(vector<pii> & a, int n, int nota) {
    int ans = 0, len = 0;
    for (int i = 0; i < n; i++) {
        if (a[i].F == nota or a[i].S == nota) len++;
        else {
            ans = max(ans, len);
            len = 0;
        }
    }
    return max(ans,len);
}

void solve() {
    int n; cin >> n;
    vector<pii> a;
    for (int i=0; i<n; i++) {
        int x,y; cin >> x >> y;
        a.emplace_back(x,y);
    }
    int max_stud = 0, nota_final = 0;
    for (int nota = 5; nota >= 1; nota--) {
        int stud = get_max_subseq(a,n,nota);
        if (stud >= max_stud) {
            max_stud = stud;
            nota_final = nota;
        }
    }
    cout << max_stud << " " << nota_final << "\n";
}

int main() {
    fast_io;
    solve();
    return 0;
}
