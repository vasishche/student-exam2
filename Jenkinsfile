pipeline {
  agent any
  stages {
    stage('tests') {
      steps {
        git "https://github.com/vasishche/student-exam2.git"
        sh "python3 -m venv venv && . venv/bin/activate && pip install -e '.[test]' && coverage run -m pytest && coverage report"
      }
    }
  }
}
node {
    checkout scm
    def customImage = docker.build("webapp:${env.BUILD_ID}")
}

