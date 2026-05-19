<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('trains', function (Blueprint $table) {
            $table->id();
            $table->string('company', 30);
            $table->string('departure_station', 30);
            $table->string('arrival_station', 30);
            $table->date('departure_date');
            $table->time('departure_time');
            $table->time('arrival_time');
            $table->string('train_code', 6);
            $table->unsignedTinyInteger('carriages_number');
            $table->boolean('is_on_time')->default(true);
            $table->boolean('is_cancelled')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('trains');
    }
};
