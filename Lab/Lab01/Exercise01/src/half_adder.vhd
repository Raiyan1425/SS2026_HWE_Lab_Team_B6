
entity half_adder is
port (
A: in bit;
B: in bit;
S: out bit;
Co:out bit
);
end half_adder;

architecture Structure of half_adder is

begin

S <= A xor B;
Co <= A and B;

end architecture;