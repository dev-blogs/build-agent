# Build image
./build.sh

# Login to docker hub
docker login -u devblogs1

# Create tag
docker tag java-agent devblogs1/java-agent:1.0

# Push tag
docker push devblogs1/java-agent:1.0

# Change mvnBuildPod.yaml with new agent
