----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/29/2024 03:29:50 PM
-- Design Name: 
-- Module Name: seven_seg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_seg_decoder_tb is
--  Port ( );
end seven_seg_decoder_tb;

architecture Behavioral of seven_seg_decoder_tb is
    component seven_seg_decoder
    Port(
    variables : in STD_LOGIC_VECTOR (3 downto 0); -- Reset signal
cathodes : out STD_LOGIC_VECTOR (7 downto 0) -- Anodes signal for display
        );
     end component;
     signal Variables: std_logic_vector(3 downto 0);
      signal Cathodes: std_logic_vector(7 downto 0);
begin
    UUT: seven_seg_decoder port map(Variables=>variables, Cathodes=>cathodes);
   Variables(3) <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
Variables(2) <= '0', '1' after 40 ns, '0' after 80 ns, '1' after 120 ns;
Variables(1) <= '0', '1' after 60 ns, '0' after 120 ns, '1' after 180 ns;
Variables(0) <= '0', '1' after 80 ns, '0' after 160 ns, '1' after 240 ns;

end Behavioral;
