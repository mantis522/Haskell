-- Homework1

-- Theorem:
-- xs ++ [] = xs for all lists xs.
--
-- Proof.
-- We show the claim by structural induction "on xs".
-- Base case:
-- If xs = [] then:
-- lhs = [] ++ []
-- = []    by A1
-- rhs = []

-- Inductive step : 
-- If xs = x : xs' then :
-- lhs = (x : xs') ++ []
-- = x : (xs' ++ []) by A2
-- = x : xs'   by I.H.
-- ths = x : xs'

-- QED.


-- Homework2

-- Theorem:
-- xs ++ (ys ++ zs) = (xs ++ ys) ++ zs for all lists xs, ys, and zs.

-- Proof.
-- We show the claim by structural induction "on xs". -> 이거 안쓰면 0점.

-- Base case:
-- If xs = [] then:
-- lhs = [] ++ (ys ++ zs)
-- = ys ++ zs by A1
-- rhs = ([] ++ ys) ++ zs
-- = ys ++ zs by A1
-- If xs = x : xs' then :
-- lhs = (x : xs') ++ (ys ++ zs)
-- = x : (xs' ++ (ys ++ zs)) by A2
-- = x: ((xs' ++ ys) ++ zs) by I.H.
-- rhs = ((x : xs') ++ ys) ++ zs
-- = (x : (xs' ++ ys)) ++ zs by A2
-- = x : ((xs' ++ ys) ++ zs) by A2

-- QED.

-- 시험에 나오는 문제의 난이도는 3번 정도.

-- revapp xs ys
-- revapp [1,2,3] [4,5]
-- = revapp [2,3] [1,4,5]
-- = revapp [3] [2,1,4,5]
-- = revapp [] [3,2,1,4,5]
-- = [3,2,1,4,5]
-- = [3,2,1] ++ [4,5]
-- = rev [1,2,3] ++ [4,5]
-- = rev xs ++ ys

-- Lemma : 
-- revapp xs ys = rev xs ++ ys for all lists xs and ys.

-- Proof.

-- Theorem:
-- rev xs = revapp xs [] for all lists xs.

-- Proof.
-- lhs = revapp xs []
-- = rev xs ++ [] by Lemma
-- = rev xs by Exercise 1
-- = rhs

-- QED.

