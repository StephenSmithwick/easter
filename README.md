# Easter Project

A collection of OSX setup scripts.

## Getting Started

This project is a collection bash and ruby scripts which install all the dependencies that I usually need on a new osx install. It will install the easter source code in ~/easter.  Dependencies listed under 

### Prerequisites

This app requires little to be installed before hand but does make a number of assumptions
- You have a working internet connection
- You have available: `bash` is your shell and `wget` & `bsdtar` are on your path
- `$HOME/.bash_profile` is executed at the start of any bash session

### Installing

A step by step series of examples that tell you how to get a development env running

To download and install:

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/StephenSmithwick/easter/master/fetch.bash)"
```

In order to fetch the latest repos and fetch any missing dependencies:

```
easter
```

For further instructions:

```
easter --help
```

## Contributing

Contributions are not expected but are welcome.  Please feel free to clone, modify and submit a pull request of any clever ideas.

## Author

* **Stephen Smithwick** - [Easter](https://github.com/StephenSmithwick/easter)


## Acknowledgments

* Homebrew is a a super useful comunittee without which I would be unable install
* I have been heavily inspired by a half remember discussion of benhoskings/babushka.
