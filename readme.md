SDL3 bindings

Ensure sdl libs are installed system wide, they may be available by package manager, if not [build from source ](https://github.com/libsdl-org/SDL/blob/main/INSTALL.md)

Linux

```
sudo apt install libsdl3 libsdl3-image libsdl3-ttf
```

Mac
```
brew install sdl3 sdl3_image sdl3_ttf
```

Trying to use [Clang's Nullability Attributes](https://clang.llvm.org/docs/AttributeReference.html#nullability-attributes) to improve generated binding safety, [example](https://github.com/3xau1o/swift-sdl3-demo/blob/4ab5649cd949a1ea49269b142045b94816b9e047/Sources/SDL3/sdl3.h#L9) 

```
swift build
swift run
```

swiftly update latest
swiftly install 6.2-snapshot
swiftly use 6.2-snapshot