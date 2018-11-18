node {
   agent any
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/tstman64/cogtask.git'
      
   }
   stage('Build') {
      // Run the maven build
      sh "docker build -t 192.168.18.10:5000/cogtask ."
      sh "docker push 192.168.18.10:5000/cogtask"
   }
   stage('Deploy') {
      sh "docker stack deploy --compose-file docker-compose.yml hello"
   }
}
