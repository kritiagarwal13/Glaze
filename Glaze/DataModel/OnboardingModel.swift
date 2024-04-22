//
//  OnboardingModel.swift
//  Glaze
//
//  Created by Kriti Agarwal on 23/04/24.
//

import Foundation

struct Step: Identifiable {
    let id: Int
    let title: String
    let headline: String
    let image: String
}

let onboardingStructure: [Step] = [
    Step(
        id: 1,
        title: "Step 1 - Send",
        headline: "Text us posts and screenshots",
        image: "step-1"
    ),
    Step(
        id: 2,
        title: "Step 2 - Inspire",
        headline: "Get recs based on inspirations",
        image: "step-2"
    ),
    Step(
        id: 3,
        title: "Step 3 - Shop",
        headline: "One click and buy",
        image: "step-3"
    )
]
