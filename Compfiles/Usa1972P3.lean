/-
Copyright (c) 2025 The Compfiles Contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Shalev Wengrowsky
-/

import Mathlib.Data.Nat.Factorization.Basic

import Mathlib.Probability.Distributions.Uniform
import Mathlib.Probability.ProbabilityMassFunction.Basic
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.Data.Fin.Basic
import Mathlib.Data.Multiset.Basic

import ProblemExtraction

problem_file { tags := [.Combinatorics, .NumberTheory] }

/-!
# USA Mathematical Olympiad 1972, Problem 3

n digits, none of them 0, are randomly (and independently) generated,
find the probability that their product is divisible by 10.
-/

namespace Usa1972P3

variable (n : ℕ)
abbrev Digit := Fin 9
abbrev DigitSeq := Fin n → Digit

noncomputable def unifDistN := PMF.uniformOfFintype (DigitSeq n)


def to_nat_digit : Digit → ℕ := fun d ↦ d + 1
def is_good_seq {n} (s : DigitSeq n) := (∏a, to_nat_digit (s a)) % 10 ≠ 0
def good_seqs {n} := {s : DigitSeq n | is_good_seq s}

noncomputable determine solution : ENNReal := 1 - (8 / 9) ^ n - (5 / 9) ^ n + (4 / 9) ^ n

problem usa1972_p3 (h_n_pos : n ≠ 0) (digits : DigitSeq n) :
  (unifDistN n).toOuterMeasure good_seqs = solution n := sorry

end Usa1972P3
