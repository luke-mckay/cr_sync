// SPDX-License-Identifier: Apache-2.0
/*
 * Copyright 2021, Luke E. McKay.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* 
 * Flip-Flop Synchronizer
 * Version 0.1.1
 * A simple parameratized flip-flop synchronizer to eliminate basic
 * meta-stability issues.
 */
module cr_sync
#(
  parameter pWidth = 1,  //!< Datapath Width
  parameter pStages = 2, //!< @todo Number of stages
  parameter pSimEn = 0,  //!< @todo Enable simulation mode (random output delay)
  parameter pRstMode = 0 //!< 0 -> asynchronous;  1 -> synchronous; >1 -> none
)(
  //# {{clocks|}}
  input  wire              Clk,       //!< Clock
  input  wire              Rst_n,     //!< Reset
  //# {{data|}}
  input  wire [pWidth-1:0] D,         //!< Data In
  output reg  [pWidth-1:0] Q          //!< Data Out
);

reg [pWidth:0] tmp_q;

generate
  if (pRstMode == 0) // --------------  Async Reset
  begin
    always @(posedge Clk or negedge Rst_n)
    begin
    if (!Rst_n)
      {Q,tmp_q} <= 0;
    else
      {Q,tmp_q} <= {tmp_q,D};
    end
  end
  else if (pRstMode == 1) // ---------  Sync Reset
  begin
    always @(posedge Clk)
    begin
    if (!Rst_n)
      {Q,tmp_q} <= 0;
    else
      {Q,tmp_q} <= {tmp_q,D};
    end
  end
  else // ----------------------------  No Reset
  begin
    always @(posedge Clk)
    begin
      {Q,tmp_q} <= {tmp_q,D};
    end
  end

endmodule
