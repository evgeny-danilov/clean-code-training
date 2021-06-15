# README

Payload for Ruby meetup "Code design - make your life simplier"

## Goal
Showing the way how to build service objects by small iterations and without pre-defined architecture.

## Task description
Implement an isolated service to keep scheduled orders (bottled water delivery).
External dependencies: api requests and zone-finder

**Given an initial data structure of booked slots:**
```ruby
  [
    { date: '2020-12-07', time_period: '1', zone: 'A', address: 'street-10/7' },
    { date: '2020-12-07', time_period: '1', zone: 'A', address: 'street-23/3' },
    { date: '2020-12-07', time_period: '2', zone: 'A', address: 'street-1/6' },
    { date: '2020-12-07', time_period: '2', zone: 'A', address: 'street-1/57' },
    { date: '2020-12-07', time_period: '3', zone: 'A', address: 'street-5/7' },
  ]
```

There are maximum two slots per zone and date/time.
Zone could be found based on the input address.

**What needs to be done:**
Find the closest available slot for delivering. Calculation depends on the desired date and time, and the scecific zone.

**Example of an API request:**
```
  https://api.water.com/book
    date: '2020-12-07'
    address: 'street-10/7',
    time_period: '2'
```

**Expected result from API:**

```ruby
  { date: '2020-12-07', time_period: '3' }
```

## Structure
- *Entry point*: `lib/get_available_slot_service/entry_point.rb`

## Tools & Approaches
- *Rspec*
