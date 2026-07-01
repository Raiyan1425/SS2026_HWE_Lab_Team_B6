library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binary_to_bcd is
    Port (
        bin_in : in  STD_LOGIC_VECTOR(4 downto 0); -- 0 to 30
        tens   : out STD_LOGIC_VECTOR(3 downto 0);
        ones   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end binary_to_bcd;

architecture Behavioral of binary_to_bcd is
begin
    process(bin_in)
        variable value : integer range 0 to 31;
    begin
        value := to_integer(unsigned(bin_in));

        tens <= std_logic_vector(to_unsigned(value / 10, 4));
        ones <= std_logic_vector(to_unsigned(value mod 10, 4));
    end process;
end Behavioral;