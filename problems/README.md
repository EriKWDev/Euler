#### (First time only)
- `cd eutils`
- `nimble develop`

### Usage
- `./run.nims <problemNumber> [parameters]`

### Create a new solution
- `nimble init p<problemNumber>` <- Note the 'p'. Example: `nimble init p001`
- edit the `p<problemNumber>.nimble` file to contain a `binDir = "build"`
- Don't forget to also add `requires "eutils"` if you need the `eutils` module