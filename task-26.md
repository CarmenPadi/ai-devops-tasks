Mistakes in the Original Jenkinsfile
Typo in stesp:
The correct keyword is steps, not stesp.
Incorrect npm build command:
The command should be npm run build (not npm build).
Docker image tag mismatch:
You build the image as myapp but push as myapp:latest. The tag should be consistent.
when block placement:
The when block should be inside the stage, but before steps.
Missing steps block in Build stage:
The typo in stesp causes the block to be unrecognized.
Explanation of Fixes
Fixed Typo:
Changed stesp to steps in the Build stage.
Corrected Build Command:
Changed sh 'npm build' to sh 'npm run build' to properly invoke the npm build script.
Consistent Docker Tag:
Both docker build and docker push now use myapp:latest for consistency.
Proper when Block Placement:
Moved the when block before the steps block in the Deploy stage, as required by the declarative pipeline syntax.
