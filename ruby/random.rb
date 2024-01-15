# frozen_string_literal: true

group_size = rand(2..3)
member = %w[A B C D E F]

group_a = member.sample(group_size)
group_b = member - group_a

p group_a
p group_b
