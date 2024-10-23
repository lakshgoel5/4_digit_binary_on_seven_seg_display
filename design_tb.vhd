-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity design_tb is
--  Port ( );
end design_tb;

architecture Behavioral of design_tb is
    component design
   Port (
    f_d1 : in std_logic_vector(3 downto 0);
        f_d2 : in std_logic_vector(3 downto 0);
        f_d3 : in std_logic_vector(3 downto 0);
        f_d4 : in std_logic_vector(3 downto 0);
        f_cathode : out std_logic_vector(7 downto 0);
        f_anode : out std_logic_vector(3 downto 0);
        clk_in_1: in std_logic
 );
     end component;
     signal f_d1 : std_logic_vector(3 downto 0);
     signal f_d2 :  std_logic_vector(3 downto 0);
      signal  f_d3 :  std_logic_vector(3 downto 0);
       signal f_d4 :  std_logic_vector(3 downto 0);
        signal f_cathode :  std_logic_vector(7 downto 0);
       signal  f_anode :  std_logic_vector(3 downto 0);
       signal  clk_in_2:  std_logic;
       constant clk_period : time := 1 ns;

begin
    UUT: design port map(f_d1=>f_d1, f_d2=>f_d2, f_d3=>f_d3, f_d4=>f_d4, f_cathode=>f_cathode, f_anode => f_anode, clk_in_1 => clk_in_2);
--    stimulus_process : component design
process
    begin
----        -- Initialize Inputs
        f_d1 <= "1100";
        f_d2 <= "1001";
        f_d3 <= "0110";
        f_d4 <= "0011";

        -- Apply Test Vectors
         wait for 20 ns;
        f_d1 <= "0001";
        f_d2 <= "0010";
        f_d3 <= "0100";
        f_d4 <= "1000";
        end process;
        
        clk_process: process
    begin
        while true loop
            clk_in_2 <= '0';
            wait for clk_period/2;
            clk_in_2 <= '1';
            wait for clk_period/2;
        end loop;
    end process;

--        wait for 40 ns;
--        f_d1 <= "1111";
--        f_d2 <= "0000";
--        f_d3 <= "1111";
--        f_d4 <= "0000";

--        wait for 60 ns;
--        f_d1 <= "0101";
--        f_d2 <= "1010";
--        f_d3 <= "0101";
--        f_d4 <= "1010";

--        wait for 80 ns;
--        f_d1 <= "1110";
--        f_d2 <= "0001";
--        f_d3 <= "0011";
--        f_d4 <= "1100";

--        -- Continue applying various test vectors
--        wait for 100 ns;
--        f_d1 <= "1001";
--        f_d2 <= "0110";
--        f_d3 <= "1010";
--        f_d4 <= "0101";

--        wait for 120 ns;
--        f_d1 <= "0000";
--        f_d2 <= "0000";
--        f_d3 <= "0000";
--        f_d4 <= "0000";

        -- End simulation
--        wait;
--    end process;

end Behavioral;
