# Matlab Stateflow General overview

Stateflow machines can be utilized to integrate into Simulink models to define discrete actions based on model states. Communication to external databases and commands provide an excellent use case.

## [Basics of Stateflow](https://www.mathworks.com/help/stateflow/gs/stateflow-charts.html)

### Two fundamental elements:

1. States
2. Transitions

### Model Creation

`sfnew` - <b>S</b>tate<b>f</b>low New

```Matlab
sfnew redis_client
```

### Primary Stateflow Development Editor

|    |Editor Element  | Description      |
|:--:|:---------------|----------------------------|
| 1. | Chart Canvas   | Drawing area to create a chart by combining states, transitions, and other graphical elements.                           |
| 2. | Object palette | To the left of the canvas, displays a set of tools for adding graphical elements to your chart.                          |
| 3. | Symbols pane   | To the right of the canvas, add new data, events, and messages to the chart and resolve any undefined or unused symbols. |

![Stateflow IDE](img/Stateflow-IDE.png)
