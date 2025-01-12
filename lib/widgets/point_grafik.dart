import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartSample extends StatefulWidget {
  const BarChartSample({super.key});

  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Grafik
        const Padding(
          padding: EdgeInsets.only(
              bottom: 16.0, top: 15.0), // Jarak antara judul dan grafik
          child: Text(
            'Rating Kepuasan', // Judul di atas grafik
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 0), // Ruang untuk label Y
            child: BarChart(
              BarChartData(
                barGroups: _getBarGroups(),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        if (value % 50 == 0) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(fontSize: 12),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    axisNameWidget: const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: RotatedBox(
                        quarterTurns: 2, // Membuat teks vertikal
                        child: Text(
                          'Jumlah Penyintas',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    axisNameSize: 30,
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return const Text('SR',
                                style: TextStyle(fontSize: 12));
                          case 1:
                            return const Text('G',
                                style: TextStyle(fontSize: 12));
                          case 2:
                            return const Text('DB',
                                style: TextStyle(fontSize: 12));
                          case 3:
                            return const Text('SB',
                                style: TextStyle(fontSize: 12));
                          case 4:
                            return const Text('B',
                                style: TextStyle(fontSize: 12));
                          case 5:
                            return const Text('PM',
                                style: TextStyle(fontSize: 12));

                          default:
                            return const SizedBox();
                        }
                      },
                      reservedSize: 40,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ),

        Container(
          child: legendSection(),
        )
      ],
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(toY: 300, color: Colors.blue, width: 15),
          BarChartRodData(toY: 200, color: Colors.blue[300]!, width: 15),
          BarChartRodData(toY: 100, color: Colors.blue[100]!, width: 15),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(toY: 300, color: Colors.teal, width: 15),
          BarChartRodData(toY: 200, color: Colors.teal[300]!, width: 15),
          BarChartRodData(toY: 100, color: Colors.teal[100]!, width: 15),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(toY: 300, color: Colors.purple, width: 15),
          BarChartRodData(toY: 200, color: Colors.purple[300]!, width: 15),
          BarChartRodData(toY: 100, color: Colors.purple[100]!, width: 15),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(toY: 100, color: Colors.orange, width: 15),
          BarChartRodData(toY: 200, color: Colors.orange[300]!, width: 15),
          BarChartRodData(toY: 100, color: Colors.orange[100]!, width: 15),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(toY: 100, color: Colors.pink, width: 15),
          BarChartRodData(toY: 200, color: Colors.pink[300]!, width: 15),
          BarChartRodData(toY: 100, color: Colors.pink[100]!, width: 15),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(toY: 100, color: Colors.yellow, width: 15),
          BarChartRodData(toY: 200, color: Colors.yellow[300]!, width: 15),
          BarChartRodData(toY: 100, color: Colors.yellow[100]!, width: 15),
        ],
      ),
    ];
  }

  Widget legendSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Keterangan :',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
        legendItem(Colors.blue, 'Audio Self Resources(SR)'),
        legendItem(Colors.green, 'Audio Grounding(G)'),
        legendItem(Colors.purple, 'Audio Deep Breathing(DB)'),
        legendItem(Colors.orange, 'Audio Square Breathing(SB)'),
        legendItem(Colors.pink, 'Audio Butterfly Hug (B)'),
        legendItem(Colors.yellow, 'Audio Progresive Muscle (PM)'),
      ],
    );
  }

  Widget legendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
          ),
          margin: const EdgeInsets.only(right: 8.0),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
