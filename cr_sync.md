## cr_sync - Flip-Flop Synchronizer

*Collective RTL Library - Building Blocks Core*

-----
### Overview

A simple parameratized flip-flop synchronizer to eliminate basic meta-stability
issues.

#### Version

0.1.1_pre-alpha

##### History

31DEC21 - Created

#### Features

- list features **@todo**

#### Parameters

- pWidth   - *Datapath Width*
- pStages  - *Number of stages* **@todo**
- pSimEn   - *Enable simulation mode* **@todo**
- pRstMode - 
  - *0 -> asynchronous*
  - *1 -> synchronous*
  - *2 -> no reset / reset not used*

#### Ports

- Clk   - *Clock Input*
- Rst_n - *Reset Input*
- D     - *Asyncronous Input*
- Q     - *Synchronized Output*

-----
### Theory of Operation

#### Functional Description

**@todo** functionality

#### Block Diagram

.. figure:: cr_cr_sync_block.drawio.svg
  :figwidth: 50%
  :alt: "cr_cr_sync Block Diagram"

#### Timing Diagram(s)

.. wavedrom:: cr_cr_sync_timing.json
  :width: 100%
  :alt: "cr_cr_sync Timing Diagram"

#### Timing Constraints

**@todo** update/finish

- input is multicycle path and or false path, but if input is from IO pad then
it could need the delay set ?
  - set_multicycle_path
  - set_false_path
  - set_input_delay 
- time from tmp_q to Q  and between tmp_q's should have significant margin
  - observe slack and add stages if needed

-----
### Verification / Simulation

Verification / simulation of the core is documented in a different repo. This
other repo may also contain validation instantiations for supported
technologies. Note that this 'test' repo is under a different license.

The repo is: cr_sync_test **@todo**

### Supported Technologies

**@todo** techs

#### Utilization & Performance

**@todo** utilization and performance

ABOUT TIMELINE WHAT TO NAME THIS?

-----
### Copyright & License

```
Copyright 2021, Luke E. McKay.
SPDX-License-Identifier: Apache-2.0
```

-----
### Technical Support & Feedback

To obtain technical support, create an issue at the GitHub repository for this
project. The issue process will address reported bugs, questions, and any other
feedback via the repository issues at the GitHub repo.

Technical support for use of this core assumes the core is being used according
to the guidelines described in the core documentation. Please reference the
included documentation before creating an issue.
