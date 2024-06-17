pipeline{
    agent any
    environment{
        registry= "daviladav787/jenkins-dados"
        registryCredentials="dockerhub"
        project="jenkins-dados"
        projectVersion="1.0"
        repository="https://github.com/ddavila-dev/ddavila.git"
        repositoryCredentials="github"
    }
    stages{
        stage('Clean Workspace'){
            steps{
                cleanWs()
            }
        }
        stage('Checkout code'){
            steps{
                script{
                    git branch: 'main',
                        credentialsId: repositoryCredentials,
                        url: repository
                }
            }
        }


        stage('Build'){
            steps{
                script{
                    dockerImage= docker.build registry
                }
            }
        }

        stage('Test'){
            steps{
                script{
                    try{
                        sh 'docker run --name $project  $registry'
                    }finally{
                        sh 'docker rm $project'
                    }

                }
            }
        }

        stage('Deploy'){
            steps{
                script{
                    docker.withRegistry('',registryCredentials ){
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Cleaning Up'){
            steps{
                script{
                    sh 'docker rmi $registry'
                }
            }
        }

    }
    post{
        always{
            echo 'Registrar Build'
        }
    }
}
