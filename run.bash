docker build -t collabora-performance-tests .
docker run -it --name collabora-performance-tests collabora-performance-tests
docker cp collabora-performance-tests:/collabora-performance-tests/video/ video
docker stop palladium_view_builder