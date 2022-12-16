### [java2smali](https://github.com/warren-bank/java2smali)

#### Summary:

A command-line shell script to ease the conversion of a source code file from Java to Smali.

Repo includes 2x binary JAR files, and provides the download URL for both.
For the security minded, both JARs can be replaced (or updated).
The shell script is an easy audit.

#### Usage:

```bash
java2smali [src_dir_path] [dst_dir_path] [rel_file_path]
```

where:
* `src_dir_path`
  - is a path to the directory containing `.java` source files
  - source files include:
    * `${rel_file_path}.java`
    * any additional classes that are import by this main class
* `dst_dir_path`
  - is a path to the directory where output will be saved
  - output includes:
    * `.class` files
    * `${rel_file_path}.dex`
    * `${rel_file_path}.smali`
  - will be created, if it doesn't already exist
  - will default to `src_dir_path`, if only 2x parameters are passed to command
* `rel_file_path`
  - is a relative path to the filename (without any file extension) within `src_dir_path` that is the main class, and the target for conversion from Java to Smali

example:
```bash
java2smali ./src ./dst 'Main'
```

full example:
* refer to the [test](./test) directory

#### 3rd-Party Dependencies:

* binary JAR files included in the [tools](./tools) directory
  * [dx](https://developer.android.com/studio/releases/build-tools)
  * [baksmali](https://github.com/JesusFreke/smali)

#### Legal:

* copyright: [Warren Bank](https://github.com/warren-bank)
* license: [GPL-2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt)
