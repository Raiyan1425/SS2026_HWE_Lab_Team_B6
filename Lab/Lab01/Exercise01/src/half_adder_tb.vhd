entity half_adder_tb is
end entity;

architecture test of half_adder_tb is
component half_adder is 
port (
A: in bit;
B: in bit;
S: out bit;
Co:out bit
);
end component;
signal A_tb, B_tb, S_tb, Co_tb: bit;
begin
A_tb<='0','1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
B_tb<='0','0' after 10 ns, '1' after 20 ns, '1' after 30 ns;
UUT:half_adder port map(
A=>A_tb, B=>B_tb,S=>S_tb,Co=>Co_tb
);
end architecture;