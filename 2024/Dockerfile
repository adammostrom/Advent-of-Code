# Container for both haskell and python support.

FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  haskell-platform \
  python3 \
  python3-pip \
  curl \
  git 


RUN cabal update && cabal install QuickCheck

RUN pip install pylint black 

WORKDIR /Advent-of-Code/2024 

COPY . /Advent-of-Code/2024

CMD ["bash"]
