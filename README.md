# SwiftStub

##The Motivation
The motivation behind SwiftStub was simple, I was tired of writing realling irritating stubbing code in Swift just to check if a method was called. 

This repository forms the basic idea only, feel free to fork it and add your own ideas. Would appreciate pull requests so we can build a fairly useable stubbing solution (although probably not as powerful as OCMock for ObjC) for swift unit tests.
##The Basic Idea
A dictionary filled with objects and method names that should be tracked. To add tracking ability to methods, create a mock version of the class under test and before calling super on any method, call "methodCalled".