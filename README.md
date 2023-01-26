# httpcat

A tool that makes it easy and fun to learn http status codes.

## Requirements
- [Swift 5.5+](https://www.swift.org/getting-started/)

## Install
Start by cloning the repository and then navigate into the cloned project.
Then build the project by running

```
$ swift build -c release
```

Now copy the binary `.build/release/httpcat` to a folder in your `$PATH`.

## Usage
#### Open [http.cat](https://http.cat)
```
$ httpcat --open
```

#### Translate http status code to text
```
$ httpcat code 404
Not Found
```

#### Open http status code on [http.cat](https://http.cat)
```
$ httpcat code 404 --open
```
