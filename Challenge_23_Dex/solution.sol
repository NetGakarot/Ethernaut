// Solution:
// We are exploiting getSwapPrice() as there is mathematical error in calculating price.
/*
.....token1...token2......
10in.|.100..|..100.|.10 out
24out.|.110..|..90.|.20 in
24in.|.86..|..110.|.30 out
41out.|.110..|..80.|.30 in
41in.|.69..|..110.|.65 out
158out.|.-48..|..110.|.65 in ----> This will show error coz contract balance is low now so we will just transfer 45 only.
110out.|.0..|..90.|.45 in 
Final balance User - Token 1 - 110 , Token 2 - 20
Final balance contract - Token 1 - 0 , Token 2 - 90
*/
