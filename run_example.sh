#!/bin/bash

# Flutter Date Kit Example App Runner
# This script helps you run the example Flutter app

echo "🚀 Flutter Date Kit Example App"
echo "=============================="

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed or not in PATH"
    echo "Please install Flutter from: https://flutter.dev/docs/get-started/install"
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ Please run this script from the root directory of the date_formatter package"
    exit 1
fi

# Navigate to example app
cd example

echo "📱 Setting up example app..."

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

if [ $? -ne 0 ]; then
    echo "❌ Failed to get dependencies"
    exit 1
fi

echo "✅ Dependencies installed successfully!"

# Check for connected devices
echo "🔍 Checking for connected devices..."
flutter devices

echo ""
echo "🎯 Running the example app..."
echo "📱 The app will demonstrate all features of the date_formatter package"
echo "🔄 Use 'r' to hot reload, 'R' to hot restart, 'q' to quit"
echo ""

# Run the app
flutter run

echo ""
echo "👋 Thanks for trying the Flutter Date Kit example app!" 