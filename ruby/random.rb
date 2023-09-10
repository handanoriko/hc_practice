group = %w[A B C D E F]
n = [2, 3].sample
group_sample = group.sample(n)
group_separate_triple = group_sample.sort
group_separate_double = (group - group_sample).sort
p group_separate_triple, group_separate_double
