# ATM_demo

A program that allows a user to interact with a virutal Automatic Teller Machine
### Synopsis

This project is a small game that uses classes to enable gameplay, We are learning Ruby and using RSpec for testing and our pushes go via Tranvis and Coveralls to se if everything is working as it should.

### Motivation

We are learning Ruby and RSpec, this excercise made sense to implement and practice the skills we've learnd so far.

## Getting Started

Clone or donwload the repo and load the files in your terminal with irb.

### Load these files to run the application

**atm-demo**

```irb
load './lib/atm-demo.rb'
=> true 
```

**person**

```irb
load './lib/person.rb'
=> true 
```

### Don't load 'account.rb'

account.rb is loaded via person.rb and atm-demo.rb so there's no need to load it seperatly.

### Setting it up

**Create a new person**

```irb
person = Person.new(:name 'Aiden')
=> person
```

**Create a new ATM**

```irb
atm = ATM.new
=> atm
```

**Create a new account**

```irb
account = person.create_accout(:owner person)
=> account
```

### How to play

**Make a deposit**

Specify the ammout you wish to withdraw, the ATM has $1000 on initialize.

```irb
person.deposit(100)
=> 100
```

**Make a withdrawl**

Specify the ammout, add your own pin (it's probalby not '1234'), add your account-name and the name of the atm.

```irb
person.withdraw(amount: 100, pin: 1234, account: account, atm: atm)
=> 100
```

### Cash, balance and funds

You can check to se how much cash the person has, how much funds is in the ATM and see you account-balalce.

**Cash**

```irb
person.cash
=> 500
```

**Balance**

```irb
account.balance
=> 500
```

**Funds**

```irb
atm.funds
=> 1000
```

## Badges (yes we are that good)

<img src="https://travis-ci.org/AKidd95/ATM_demo.svg?branch=master"> <a href='https://coveralls.io/github/AKidd95/ATM_demo?branch=master'>
  <img src='https://coveralls.io/repos/github/AKidd95/ATM_demo/badge.svg?branch=master' alt='Coverage Status' />
</a>
