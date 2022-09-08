import numpy as np
def main():
  A = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
  print(np.max(A, axis = 1))
  A -= np.max(A, axis=1).reshape(-1, 1)
  print(np.exp(A) / np.sum(np.exp(A), axis = 1))
  f = np.array([7, 8, 9]) # example with 3 classes and each having large scores
  p = np.exp(f) / np.sum(np.exp(f)) # Bad: Numeric problem, potential blowup
  print(p)

main()