library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity One_Digit_Counter is
    port (
        CLK   : in  STD_LOGIC;
        START : in  STD_LOGIC;
        CLR   : in  STD_LOGIC;
        SEG   : out STD_LOGIC_VECTOR(6 downto 0);
        AN    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end One_Digit_Counter;

architecture Behavioral of One_Digit_Counter is

    signal div_counter : unsigned(25 downto 0) := (others => '0');
    signal slow_clk    : STD_LOGIC := '0';
    signal count_value : integer range 0 to 9 := 0;

begin

    -- Clock divider: creates a slower clock from the 100 MHz FPGA clock
    process(CLK)
    begin
        if rising_edge(CLK) then
            div_counter <= div_counter + 1;
            slow_clk <= div_counter(25);
        end if;
    end process;

    -- Decimal counter: counts from 0 to 9
    process(slow_clk, CLR)
    begin
        if CLR = '1' then
            count_value <= 0;
        elsif rising_edge(slow_clk) then
            if START = '1' then
                if count_value = 9 then
                    count_value <= 0;
                else
                    count_value <= count_value + 1;
                end if;
            end if;
        end if;
    end process;

    -- BCD to 7-segment decoder, active-low for Nexys A7
    process(count_value)
    begin
        case count_value is
            when 0 => SEG <= "1000000";
            when 1 => SEG <= "1111001";
            when 2 => SEG <= "0100100";
            when 3 => SEG <= "0110000";
            when 4 => SEG <= "0011001";
            when 5 => SEG <= "0010010";
            when 6 => SEG <= "0000010";
            when 7 => SEG <= "1111000";
            when 8 => SEG <= "0000000";
            when 9 => SEG <= "0010000";
            when others => SEG <= "1111111";
        end case;
    end process;

    -- Enable only the rightmost seven-segment digit
    AN <= "11111110";

end Behavioral;