# Haskell-RSA
A command-line interface for encryption, decryption, and key generation. This is a Haskell implementation of [Textbook RSA](https://crypto.stackexchange.com/questions/1448/definition-of-textbook-rsa "Crypto StackExchange"). The interface is written using a simple bash script which calls the executables compiled from Haskell.

For educational purposes only. Not to be used for real-world security purposes.

##Installation & Use
There are only four required files for use: the bash script interface `BashInterface` and the three Haskell executables: `generateKey`, `encrypt`, and `decrypt`. 

These are included in the repository, so you can simply clone and run the script like so `./BashInterface`.

If you want to compile the source code on your own (possibility after editing), I've included a bash script which will compile all the required files for you (analogous to a makefile).


    git clone https://github.com/minyc510/Haskell-RSA.git
    cd Haskell-RSA
    [./BashInterface] or [./compile]

