library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Two_Digit_Counter is
    port (
        CLK   : in  STD_LOGIC;
        START : in  STD_LOGIC;
        CLR   : in  STD_LOGIC;
        SEG   : out STD_LOGIC_VECTOR(6 downto 0);
        AN    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Two_Digit_Counter;

architecture Behavioral of Two_Digit_Counter is

    signal div_counter     : unsigned(25 downto 0) := (others => '0');
    signal refresh_counter : unsigned(16 downto 0) := (others => '0');

    signal slow_clk    : STD_LOGIC := '0';
    signal refresh_clk : STD_LOGIC := '0';

    signal ones_digit : integer range 0 to 9 := 0;
    signal tens_digit : integer range 0 to 9 := 0;

    signal current_digit : integer range 0 to 9 := 0;

begin

    -- Slow clock for visible counting
    process(CLK)
    begin
        if rising_edge(CLK) then
            div_counter <= div_counter + 1;
            slow_clk <= div_counter(25);
        end if;
    end process;

    -- Refresh clock for display multiplexing
    process(CLK)
    begin
        if rising_edge(CLK) then
            refresh_counter <= refresh_counter + 1;
            refresh_clk <= refresh_counter(16);
        end if;
    end process;

    -- Counter 00 to 99
    process(slow_clk, CLR)
    begin
        if CLR = '1' then
            ones_digit <= 0;
            tens_digit <= 0;

        elsif rising_edge(slow_clk) then
            if START = '1' then
                if ones_digit = 9 then
                    ones_digit <= 0;

                    if tens_digit = 9 then
                        tens_digit <= 0;
                    else
                        tens_digit <= tens_digit + 1;
                    end if;

                else
                    ones_digit <= ones_digit + 1;
                end if;
            end if;
        end if;
    end process;

    -- Display multiplexer
    process(refresh_clk, ones_digit, tens_digit)
    begin
        if refresh_clk = '0' then
            AN <= "11111110";
            current_digit <= ones_digit;
        else
            AN <= "11111101";
            current_digit <= tens_digit;
        end if;
    end process;

    -- BCD to 7-segment decoder, active-low
    process(current_digit)
    begin
        case current_digit is
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

end Behavioral;