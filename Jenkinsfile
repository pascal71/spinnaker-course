node {
	stage('Checkout') {
		checkout scm
	}
	stage('Build slides with asciidoctor') {
      sh 'asciidoctor -b html spinnaker.asc'
	}
	stage('Apply styles to slides') {
      sh '/usr/local/bin/asciidoctor-revealjs spinnaker.asc'
	}
	stage('Build lab-book with asciidoctor') {
      sh 'asciidoctor -b html lab_book.asc'
	}
	stage('Configure index.html') {
	    sh "echo '<BR><BR><BR><B>${JOB_NAME}:${BUILD_ID}</B><BR>' >> index.html"
	}

	stage('Build Container') {
		docker.build('${JOB_NAME}', '-f src/main/docker/Dockerfile .')
	}
	stage('Write properties') {
	    sh "> spinnaker.properties"
	    sh "echo 'JOB_NAME=${JOB_NAME}' >> spinnaker.properties"
	    sh "echo 'BUILD_ID=${BUILD_ID}' >> spinnaker.properties"
	    archiveArtifacts artifacts: 'spinnaker.properties', fingerprint: true
	}
	stage('Push to ECR') {
		docker.withRegistry('https://465848653329.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:spinnaker-admin-aws') {
			docker.image('${JOB_NAME}').push('${BUILD_ID}')
	   }
	}
}
