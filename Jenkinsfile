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
    def customImage = docker.build("vashche/epamexam:webapp-${env.BUILD_ID}")

    docker.withRegistry('','3e74743f-50bd-4816-a4b8-ee2914aa9282') {
        customImage.push()
    }
}

