[![Code Climate](https://codeclimate.com/github/ejbyne/inject-rewrite/badges/gpa.svg)](https://codeclimate.com/github/ejbyne/inject-rewrite)
[![Test Coverage](https://codeclimate.com/github/ejbyne/inject-rewrite/badges/coverage.svg)](https://codeclimate.com/github/ejbyne/inject-rewrite)

# Rewriting Ruby's Inject Method

## Summary

I have rewritten Ruby's inject method (using both iterative and recursive methods) as part of my Week 2 challenge at Makers Academy.

This was a tough challenge which really helped me get to grips with using blocks and procs and understanding where they come in handy. Whilst it was relatively easy to produce something which performed the basic functions of the inject method, it required quite a lot of thought to ensure that the method was capable of receiving either blocks or symbols (with or without an initial value) and then to refactor the code into manageable chunks. 

## Technologies used

- Ruby
- RSpec

## Completed tasks

- Reopen the Array class or subclass it.
- Rewrite the inject method. Write a test for it first. Don't worry about returning an enumerator, assume a block is always given
- Name your method differently (that is, not inject() or subclass Array) because rspec uses inject() internally, so the tests will fail with weird messages unless your implementation of inject is perfect.
- If you would like a challenge, rewrite inject using two approaches: using iterators and using recursion but it’s not required to pass the test.
- Push the solution to a Github repo called 'inject-rewrite'

## Instructions

Clone the repo on your machine:
```
$ https://github.com/ejbyne/inject-rewrite.git
```

Change into the directory and run the tests:
```
$ cd inject-rewrite
$ rspec
```

## Favourite Code Snippet

This was my way of converting a symbol passed as an argument to the inject method into a block:
```ruby
def symbol_to_block(options)
  options.select{ |option| option.is_a?(Symbol) }.first.to_proc 
end
```
