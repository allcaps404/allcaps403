<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class EnvironmentDataExport implements FromCollection, WithHeadings, WithStyles, ShouldAutoSize
{
    protected $data;

    public function __construct($data)
    {
        $this->data = $data;
    }

    public function collection()
    {
        return $this->data->map(function ($entry) {
            return [
                'temperature' => number_format($entry->temperature, 2) . ' °C',
                'humidity' => number_format($entry->humidity, 2) . ' %',
                'avg_soil_moisture' => number_format($entry->avg_soil_moisture, 2) . ' %',
                'created_at' => \Carbon\Carbon::parse($entry->created_at)->format('M d, Y h:i A'),
            ];
        });
    }

    public function headings(): array
    {
        return [
            'Temperature (°C)',
            'Humidity (%)',
            'Soil Moisture (%)',
            'Date & Time',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        $sheet->getStyle('A1:D1')->applyFromArray([
            'font' => [
                'bold' => true,
                'color' => ['rgb' => 'FFFFFF'],
                'size' => 12,
            ],
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => ['rgb' => '4CAF50'],
            ],
            'alignment' => [
                'horizontal' => 'center',
                'vertical' => 'center',
            ],
        ]);

        $sheet->getStyle('A2:D' . ($sheet->getHighestRow() + 1))
            ->getAlignment()
            ->setHorizontal('center');

        return [];
    }
}
