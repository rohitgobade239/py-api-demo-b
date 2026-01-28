package docker.security

# Fail if Dockerfile does not contain a USER instruction
deny[msg] {
  input[i].Instruction == "FROM"
  not user_defined
  msg := "❌ Dockerfile must include a non-root USER instruction."
}

# Helper rule: check if a USER instruction is defined
user_defined {
  input[i].Instruction == "USER"
  input[i].Value != "root"
}
