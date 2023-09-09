group = %w[A B C D E F]
n = (2..3).to_a
n.shuffle!
z = n.shift
group_sample = group.sample(z)
group_separate_triple = group_sample.sort
group_separate_double = (group - group_sample).sort
p group_separate_triple, group_separate_double
